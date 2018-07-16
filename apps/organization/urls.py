# -*- coding: UTF-8 -*-
__author__ = 'chendongyi'
__date__ = '2018/6/12 9:31'


from django.urls import path,include
from .views import OrgListView,AddUserAskView,OrgHomeView, OrgCourseView

from .views import OrgDescView,OrgTeacherView,AddFavView, TeacherListView, TeacherDetailView


urlpatterns = [
    #课程机构首页
    path('list/', OrgListView.as_view(), name="org_list"),
    path('add_ask/', AddUserAskView.as_view(), name="add_ask"),
    path('home/<int:org_id>', OrgHomeView.as_view(), name="org_home"),
    path('course/<int:org_id>', OrgCourseView.as_view(), name="org_course"),
    path('desc/<int:org_id>', OrgDescView.as_view(), name="org_desc"),
    path('org_teacher/<int:org_id>', OrgTeacherView.as_view(), name="org_teacher"),

    #机构收藏
    path('add_fav/', AddFavView.as_view(), name="add_fav"),

    #授课讲师列表
    path('teacher/list/', TeacherListView.as_view(), name="teacher_list"),

    #教师详情页
    path('teacher/detail/<int:teacher_id>', TeacherDetailView.as_view(), name="teacher_detail"),

]

