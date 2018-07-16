# -*- coding: UTF-8 -*-
__author__ = 'chendongyi'
__date__ = '2018/6/21 10:06'

from django.urls import path,include
from .views import UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView
from .views import UpdateEmailView, MyCourseView, MyFavView, MymessageView

urlpatterns = [

    path('info/', UserInfoView.as_view(), name="user_info"),
    #用户头像上传
    path('image/upload/', UploadImageView.as_view(), name="image_upload"),

    #用户个人中心修改密码
    path('update/pwd/', UpdatePwdView.as_view(), name="update_pwd"),

    #发送邮箱验证码
    path('sendemail_code/', SendEmailCodeView.as_view(), name="sendemail_code"),

    # 修改邮箱
    path('update_email/', UpdateEmailView.as_view(), name="update_email"),

    # 修改邮箱
    path('mycourse/', MyCourseView.as_view(), name="mycourse"),

    # 我收藏的课程机构
    path('myfav/', MyFavView.as_view(), name="myfav_org"),

    # 我的消息
    path('mymessage/', MymessageView.as_view(), name="mymessage"),

]