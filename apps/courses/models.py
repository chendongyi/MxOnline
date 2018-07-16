# _*_ coding:utf-8 _*_
from datetime import datetime

from django.db import models
from organization.models import CourseOrg,Teacher
# Create your models here.


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg,verbose_name=u"课程机构",null=True,blank=True,on_delete=models.CASCADE)
    name = models.CharField(max_length=50,verbose_name=u"课程")
    desc = models.CharField(max_length=300, verbose_name=u"课程描述")
    detail = models.TextField(verbose_name=u"课程详情")
    teacher = models.ForeignKey(Teacher,verbose_name=u"讲师",null=True,blank=True,on_delete=models.CASCADE)
    degree = models.CharField(verbose_name=u"难度",choices=(("cj",u"初级"),("zj",u"中级"),("gj",u"高级")),max_length=4)
    learn_times = models.IntegerField(default=0,verbose_name=u"学习时长（分钟数）")
    students = models.IntegerField(default=0,verbose_name=u"学习人数")
    fav_nums = models.IntegerField(default=0,verbose_name=u"收藏人数")
    image = models.ImageField(upload_to="courses/%Y/%m",verbose_name=u"封面图",max_length=100)
    click_nums = models.IntegerField(default=0,verbose_name=u"点击数")
    category = models.CharField(max_length=20,verbose_name=u"课程类别",default=u"后端开发")
    tag = models.CharField(max_length=10,verbose_name=u"课程标签",default=u"")
    youneed_know = models.CharField(max_length=300, verbose_name=u"课程须知", default="")
    teacher_advice = models.CharField(max_length=300, verbose_name=u"老师告诉你", default="")
    is_banner = models.BooleanField(default=False, verbose_name=u"是否轮播")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程"
        verbose_name_plural = verbose_name

    def get_zj_nums(self):
        #获取课程章节数
        return self.lesson_set.all().count()
    get_zj_nums.short_description = u"章节数"

    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a href = 'http://www.baidu.com'>跳转</>")

    go_to.short_description = u"跳转"

    def get_learn_users(self):
        return self.usercourse_set.all()[:5]

    #返回课程所有章节
    def get_course_lesson(self):
        return self.lesson_set.all()

    def __str__(self):
        return self.name


class BannerCourse(Course):
    class Meta:
        verbose_name = "轮播课程"
        verbose_name_plural = verbose_name
        proxy = True


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程", on_delete=models.CASCADE)
    name = models.CharField(max_length=100,verbose_name=u"章节名")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"章节"
        verbose_name_plural = verbose_name

    def get_lesson_video(self):
        return self.video_set.all()

    def __str__(self):
        return self.name

class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name=u"章节", on_delete=models.CASCADE)
    name = models.CharField(max_length=100,verbose_name=u"视频名")
    url = models.CharField(max_length=200,verbose_name=u"访问地址",default="")
    learn_times = models.IntegerField(default=0,verbose_name=u"学习时长（分钟数）")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"视频"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程", on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name=u"名称")
    download = models.FileField(max_length=100,upload_to="course/resource/%Y/%m",verbose_name=u"资源文件")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程资源"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name