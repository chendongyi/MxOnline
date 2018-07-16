# _*_ coding:utf-8 _*_
from datetime import date

from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse, HttpResponseRedirect
import json
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render_to_response

from .models import UserProfile,EmailVerifyRecord, Banner
from .forms import LoginForm,RegisterForm,ForgetForm,ModifyPwdForm, UploadImageForm, UserInfoForm
from utils.email_send import send_register_email
from courses.models import Course
from utils.mixin_utils import LoginRequiredMixin
from operation.models import UserCourse, UserFavorite, UserMessage
from organization.models import  CourseOrg,Teacher
# Create your views here.


class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None

class ActiveUserView(View):
    def get(self,request,active_code):
        try:
            all_records = EmailVerifyRecord.objects.filter(code=active_code)
            if all_records:
                for record in all_records:
                    email = record.email
                    user = UserProfile.objects.get(email=email)
                    user.is_active = True
                    user.save()
            else:
                return render(request,"active_fail.html")
            return render(request, "login.html")
        except Exception as e:
            None


class RegisterView(View):
    def get(self, request):
        register_form = RegisterForm()
        return render(request, "register.html",{"register_form":register_form})
    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get("email", "")
            if UserProfile.objects.get(email=user_name):
                return render(request, "register.html",{"register_form":register_form,"msg":"用户已经存在!"})
            pass_word = request.POST.get("password", "")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.is_active = False
            user_profile.email = user_name
            user_profile.password = make_password(pass_word)
            user_profile.save()

            #写入欢迎注册消息
            user_message = UserMessage()
            user_message.user = user_profile.id
            user_message.message = "欢迎注册慕学在线网"
            user_message.save()

            send_register_email(user_name,"register")
            return render(request,"login.html",{})
        else:
            return render(request, "register.html",{"register_form":register_form})


class LogoutView(View):
    """
    用户登出
    """
    def get(self,request):
        logout(request)
        #重定向到首页
        from django.urls import reverse
        return HttpResponseRedirect(reverse('index'))




class LoginView(View):
    def get(self, request):
        return render(request, "login.html", {})
    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    from django.urls import reverse
                    return HttpResponseRedirect(reverse('index'))
                else:
                    return render(request,"login.html", {"msg": "用户未激活!"})
            else:
                return render(request, "login.html", {"msg": "用户名或密码错误!"})
            pass
        else:
            return render(request, "login.html", {"login_form":login_form})


class ForgetPwdView(View):
    def get(self,request):
        forget_form = ForgetForm()
        return render(request,"forgetpwd.html",{"forget_form":forget_form})
    def post(self,request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get("email","")
            send_register_email(email, "forget")
            return render(request,"send_success.html",{})
        else:
            return render(request,"forgetpwd.html",{"forget_form":forget_form})


class ResetView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request,"password_reset.html",{"email":email})
        else:
            return render(request,"active_fail.html")


class ModifyPwdView(View):
    """
    修改用户密码
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            new_password1 = request.POST.get("password1","")
            new_password2 = request.POST.get("password2", "")
            email = request.POST.get("email","")
            if new_password1 == new_password2:
                user = UserProfile.objects.get(email=email)
                if user:
                    user.password = make_password(new_password1)
                    user.save()
                    return render(request,"login.html",{})
            else:
                return render(request,"password_reset.html",{"email":email,"msg":"密码不一致!"})
        else:
            email = request.POST.get("email","")
            return render(request, "password_reset.html", {"email": email, "modify_form": modify_form})

# def user_login(request):
#     if request.method == "POST":
#         user_name = request.POST.get("username", "")
#         pass_word = request.POST.get("password", "")
#         user = authenticate(username = user_name,password= pass_word)
#         if user is not None:
#             login(request, user)
#             return render(request, "index.html", {})
#         else:
#             return render(request, "login.html", {"msg":"用户名或密码错误!"})
#     elif request.method == "GET":
#         return render(request,"login.html", {})


# class IndexView(View):

class UserInfoView(LoginRequiredMixin, View):
    """
    用户个人信息
    """
    def get(self,request):
        user = request.user
        #按YYYY-MM-DD 格式化显示birthday到页面
        birthday = date.isoformat(user.birthday)
        return render(request, 'usercenter-info.html',{
            "birthday":birthday,
        })
    def post(self,request):
        user_info_form = UserInfoForm(request.POST,instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')



class UploadImageView(LoginRequiredMixin, View):
    """
    用户修改头像
    """
    def post(self,request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')


class UpdatePwdView(View):
    """
    个人中心修改用户密码
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            new_password1 = request.POST.get("password1","")
            new_password2 = request.POST.get("password2", "")
            if new_password1 == new_password2:
                user = request.user
                user.password = make_password(new_password1)
                user.save()
                return HttpResponse('{"status":"success"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail", "msg":"密码不一致!"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')


class SendEmailCodeView(LoginRequiredMixin, View):
    """
    发送邮箱验证码
    """
    def get(self,request):
        email = request.GET.get('email','')
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已经存在"}', content_type='application/json')
        send_register_email(email, "update_email")
        return HttpResponse('{"status":"success"}', content_type='application/json')


class UpdateEmailView(LoginRequiredMixin,View):
    """
    修改个人邮箱
    """
    def post(self,request):
        email = request.POST.get('email','')
        code = request.POST.get('code','')

        if EmailVerifyRecord.objects.filter(code=code,email=email,send_type="update_email"):
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')

        else:
            return HttpResponse('{"email":"验证码出错"}', content_type='application/json')


class MyCourseView(LoginRequiredMixin,View):
    """
    用户课程页面
    """
    def get(self,request):
        user_courses = UserCourse.objects.filter(user=request.user)

        return render(request,'usercenter-mycourse.html',{
            "user_courses":user_courses,
        })

class MyFavView(LoginRequiredMixin, View):
    """
    用户收藏的机构，课程，讲师
    """
    def get(self,request):
        fav_list = []

        #收藏类别筛选
        fav_type = request.GET.get('type',"")
        if fav_type == 'org' or fav_type == '':
            fav_orgs = UserFavorite.objects.filter(user=request.user, fav_type=2)
            for fav_org in fav_orgs:
                org = CourseOrg.objects.get(id=fav_org.fav_id)
                fav_list.append(org)
        elif fav_type == 'teacher':
            fav_teachers = UserFavorite.objects.filter(user=request.user, fav_type=3)
            for fav_teacher in fav_teachers:
                teacher = Teacher.objects.get(id=fav_teacher.fav_id)
                fav_list.append(teacher)
        elif fav_type == 'course':
            fav_courses = UserFavorite.objects.filter(user=request.user, fav_type=1)
            for fav_course in fav_courses:
                course = Course.objects.get(id=fav_course.fav_id)
                fav_list.append(course)

        return render(request,'usercenter-fav-org.html',{
            "fav_list":fav_list,
            "fav_type":fav_type,
        })


class MymessageView(LoginRequiredMixin,View):
    """
    我的消息
    """
    def get(self,request):
        all_messages = UserMessage.objects.filter(user=request.user.id)

        all_unread_messages = UserMessage.objects.filter(user=request.user.id, has_read=False)
        for unread_message in all_unread_messages:
            unread_message.has_read = True
            unread_message.save()

        # 对讲师进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_messages, 1, request=request)
        messages = p.page(page)
        return render(request,'usercenter-message.html',{
            "messages":messages,
        })


class IndexView(View):
    #网站首页
    def get(self,request):
        #取出轮播图
        all_banner = Banner.objects.all().order_by('index')
        courses = Course.objects.filter(is_banner=False)[:6]
        banner_courses = Course.objects.filter(is_banner=True)[:3]
        course_orgs = CourseOrg.objects.all()[:15]

        return render(request,'index.html',{
            "all_banner":all_banner,
            "courses":courses,
            "banner_courses":banner_courses,
            "course_orgs":course_orgs,
        })


def page_not_found(request):
    #全局404处理函数
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


def page_error(request):
    #全局500处理函数
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response


