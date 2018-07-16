# _*_ coding:utf-8 _*_
from datetime import datetime

from django.db import models

# Create your models here.


class CityDict(models.Model):
    name = models.CharField(max_length=20, verbose_name=u"城市名")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")
    desc = models.CharField(max_length=200,verbose_name=u"描述")

    class Meta:
        verbose_name = u"城市"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class CourseOrg(models.Model):
    name = models.CharField(max_length=50, verbose_name=u"机构名称")
    desc = models.TextField(verbose_name=u"机构描述")
    category = models.CharField(max_length=20, choices=(("pxjg",u"培训机构"),("gr",u"个人"),("gx",u"高校")),verbose_name=u"机构类别",default="pxjg")
    click_nums = models.IntegerField(default=0,verbose_name=u"点击数")
    fav_nums = models.IntegerField(default=0,verbose_name=u"收藏数")
    image = models.ImageField(upload_to="org/%Y/%m",verbose_name=u"封面图",max_length=100)
    address = models.CharField(max_length=100,verbose_name=u"机构地址")
    city = models.ForeignKey(CityDict,verbose_name=u"所在城市", on_delete=models.CASCADE)
    students = models.IntegerField(default=0,verbose_name=u"学习人数")
    course_nums = models.IntegerField(default=0,verbose_name=u"课程数")
    tag = models.CharField(max_length=10, verbose_name=u"机构标签",default=u"全国知名")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程机构"
        verbose_name_plural = verbose_name

    #获取课程机构教师数量
    def get_teacher_nums(self):
        return self.teacher_set.all().count()

    def __str__(self):
        return self.name


class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg, verbose_name=u"所属机构",on_delete=models.CASCADE)
    name = models.CharField(max_length=50, verbose_name=u"教师名")
    work_years = models.IntegerField(default=0,verbose_name=u"工作年限")
    work_company = models.CharField(max_length=50, verbose_name=u"就职公司")
    work_position = models.CharField(max_length=50, verbose_name=u"公司职位")
    points = models.CharField(max_length=50, verbose_name=u"教学特点")
    click_nums = models.IntegerField(default=0,verbose_name=u"点击数")
    fav_nums = models.IntegerField(default=0,verbose_name=u"收藏数")
    age = models.IntegerField(default=18,verbose_name=u"年龄")
    image = models.ImageField(upload_to="teacher/%Y/%m",verbose_name=u"头像",max_length=100,default='')
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"教师"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

