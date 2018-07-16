# -*- coding: UTF-8 -*-
__author__ = 'chendongyi'
__date__ = '2018/6/13 11:08'


from django.urls import path,include
from .views import CourseListView,CourseDetailView,CourseInfoView, CommentsView, AddCommentsView, VideoPlayView

urlpatterns = [
    #课程机构首页
    path('list/', CourseListView.as_view(), name="course_list"),

    #课程详情页
    path('detail/<int:course_id>', CourseDetailView.as_view(), name="course_detail"),

    #课程章节
    path('info/<int:course_id>', CourseInfoView.as_view(), name="course_info"),

    #课程评论
    path('comments/<int:course_id>', CommentsView.as_view(), name="course_comments"),

    #添加评论
    path('add_comment/', AddCommentsView.as_view(), name="add_comment"),

    path('video/<int:video_id>', VideoPlayView.as_view(), name="video_play"),

    # path('home/<int:org_id>', OrgHomeView.as_view(), name="org_home"),
    # path('course/<int:org_id>', OrgCourseView.as_view(), name="org_course"),
    # path('desc/<int:org_id>', OrgDescView.as_view(), name="org_desc"),
    # path('teacher/<int:org_id>', OrgTeacherView.as_view(), name="org_teacher"),
    #
    # #机构收藏
    # path('add_fav/', AddFavView.as_view(), name="add_fav"),

]

