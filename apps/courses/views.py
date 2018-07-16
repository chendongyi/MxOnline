# -*- coding: UTF-8 -*-
from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
from django.http import HttpResponse

from .models import Course,CourseResource,Video
from operation.models import UserFavorite, CourseComments, UserCourse
from utils.mixin_utils import LoginRequiredMixin
# Create your views here.


class CourseListView(View):
    """
    课程列表功能
    """
    def get(self, request):

        current_page = "course_list"
        #所有课程
        all_courses = Course.objects.all()

        #右侧热门课程排名
        hot_courses = all_courses.order_by("-click_nums")[:3]

        #全局搜索功能
        search_keywords = request.GET.get('keywords',"")
        if search_keywords:
            all_courses = all_courses.filter(Q(name__icontains=search_keywords)
                                             |Q(desc__icontains=search_keywords)
                                             |Q(detail__icontains=search_keywords))

        #课程排序
        sort = request.GET.get('sort',"")
        if sort:
            if sort == "new":
                all_courses = all_courses.order_by("-add_time")
            elif sort == "hot":
                all_courses = all_courses.order_by("-click_nums")
            elif sort == "students":
                all_courses = all_courses.order_by("-students")


        # course_nums = all_courses.count()
        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_courses, 3, request=request)
        courses = p.page(page)


        return render(request,"course-list.html",{
            "all_courses":courses,
            "hot_courses":hot_courses,
            "sort":sort
        })


class CourseDetailView(View):
    """
    课程详情页
    """
    def get(self,request,course_id):
        current_course = Course.objects.get(id=int(course_id))
        current_org = current_course.course_org

        #增加课程点击数
        current_course.click_nums +=1
        current_course.save()

        #判断用户收藏的状态
        has_fav_course = False
        has_fav_org = False
        if request.user.is_authenticated:
            if(UserFavorite.objects.filter(user=request.user,fav_id=current_course.id,fav_type=1)):
                has_fav_course = True
            if (UserFavorite.objects.filter(user=request.user, fav_id=current_course.course_org.id, fav_type=2)):
                has_fav_org = True

        tag = current_course.tag
        if tag:
            relate_courses = Course.objects.filter(tag=tag).exclude(id=current_course.id)[:1]
        else:
            relate_courses = []

        return render(request,'course-detail.html',{
            "current_course":current_course,
            "relate_courses":relate_courses,
            "has_fav_course":has_fav_course,
            "has_fav_org":has_fav_org,

        })

class CourseInfoView(LoginRequiredMixin,View):
    """
    课程章节信息
    """
    def get(self,request,course_id):
        course = Course.objects.get(id=course_id)

        #学习人数+1
        if UserCourse.objects.filter(user=request.user, course=course):
            # 如果用户已经学习了该课程则不再+1
            pass
        else:
            course.students +=1
            course.save()

        user_course = UserCourse.objects.filter(user=request.user,course=course)
        if not user_course:
            user_course = UserCourse(user=request.user,course=course)
            user_course.save()

        all_resources = CourseResource.objects.filter(course=course)

        user_courses = UserCourse.objects.filter(course=course)
        #取出所有学过这门课程的用户id
        user_ids = [user_course.user.id for user_course in user_courses]
        #取出所有用户id学过的其他所有课程
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        #取出所有课程id
        course_ids = [user_course.course.id for user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).exclude(id=course_id).order_by("-click_nums")[:5]
        return render(request,'course-video.html',{
            "course":course,
            "all_resources":all_resources,
            "relate_courses":relate_courses

        })


class CommentsView(LoginRequiredMixin,View):
    def get(self,request,course_id):
        course = Course.objects.get(id=course_id)

        all_comments = CourseComments.objects.filter(course=course)
        all_resources = CourseResource.objects.filter(course=course)
        return render(request,'course-comment.html',{
            "course":course,
            "all_comments":all_comments,
            "all_resources":all_resources,
        })


class AddCommentsView(View):
    """
    添加用户评论
    """
    def post(self,request):
        if not request.user.is_authenticated:
            #判断用户登录状态
            return HttpResponse('{"status":"fail","msg":"用户未登录"}',content_type='application/json')

        course_id = request.POST.get("course_id",0)
        comments = request.POST.get("comments","")
        if int(course_id) > 0 and comments:
            course_comments = CourseComments()
            course = Course.objects.get(id=course_id)
            course_comments.course = course
            course_comments.comments = comments
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status":"success","msg":"添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail","msg":"添加失败"}',content_type='application/json')


class VideoPlayView(View):
    """
    视频播放
    """
    def get(self,request,video_id):
        video = Video.objects.get(id=int(video_id))
        course = video.lesson.course

        user_course = UserCourse.objects.filter(user=request.user,course=course)
        if not user_course:
            user_course = UserCourse(user=request.user,course=course)
            user_course.save()

        all_resources = CourseResource.objects.filter(course=course)

        user_courses = UserCourse.objects.filter(course=course)
        #取出所有学过这门课程的用户id
        user_ids = [user_course.user.id for user_course in user_courses]
        #取出所有用户id学过的其他所有课程
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        #取出所有课程id
        course_ids = [user_course.course.id for user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).exclude(id=course.id).order_by("-click_nums")[:5]
        return render(request,'course-play.html',{
            "course":course,
            "all_resources":all_resources,
            "relate_courses":relate_courses,
            "video":video,

        })
