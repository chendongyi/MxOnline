# _*_ coding:utf-8 _*_
"""MxOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from django.views.generic import TemplateView
import xadmin
from django.views.static import serve

from users.views import LoginView,RegisterView,ActiveUserView, IndexView
from users.views import ForgetPwdView,ResetView,ModifyPwdView,LogoutView
from organization.views import OrgListView
from MxOnline.settings import MEDIA_ROOT
#import
urlpatterns = [
    path('xadmin/', xadmin.site.urls, name='admin'),

    #首页
    path('', IndexView.as_view(),name="index"),

    #path('', TemplateView.as_view(template_name="index.html"),name="index"),

    #用户登录
    path('login/', LoginView.as_view(), name="login"),
    # 用户登出
    path('logout/', LogoutView.as_view(), name="logout"),

    #用户注册
    path('register/', RegisterView.as_view(), name="register"),

    path('captcha/', include('captcha.urls')),
    path('active/<slug:active_code>/',ActiveUserView.as_view(), name="user_active"),

    #忘记密码
    path('forget/',ForgetPwdView.as_view(),name="forget_pwd"),
    #重置密码
    path('reset/<slug:active_code>/', ResetView.as_view(), name="reset_pwd"),
    #修改密码
    path('modify_pwd/', ModifyPwdView.as_view(), name="modify_pwd"),

    #配置上传文件的访问处理函数
    path('media/<path:path>', serve, {"document_root":MEDIA_ROOT}),

    #path('static/<path:path>', serve, {"document_root": STATIC_ROOT}),

    #课程机构url配置
    path('org/', include(('organization.urls', 'organization'),namespace="org")),

    # 课程相关url配置
    path('course/', include(('courses.urls', 'courses'), namespace="course")),

    #个人中心
    path('users/', include(('users.urls', 'users'), namespace="user")),

]

#全局404页面配置
handler404 = 'users.views.page_not_found'

#全局500页面配置
handler500 = 'users.views.page_error'


