# -*- coding: UTF-8 -*-
__author__ = 'chendongyi'
__date__ = '2018/6/12 9:21'
import re

from django import forms

from operation.models import UserAsk,UserFavorite


class UserAskForm(forms.ModelForm):
    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']

    def clean_mobile(self):
        """
        验证手机号码是否合法
        """
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = "^1(3[0-9]|4[579]|5[0-35-9]|7[0-9]|8[0-9])\d{8}$"
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError(u"手机号码非法",code="mobile_invalid")


class UserFavForm(forms.ModelForm):
    class Meta:
        model = UserFavorite
        fields = ['user','fav_id','fav_type',]
