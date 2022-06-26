from django.contrib import admin
from .models import Admin, Log_Record, Purchase, Comment, Order
# Register your models here.
admin.site.register(Admin)
admin.site.register(Log_Record)
admin.site.register(Purchase)
admin.site.register(Comment)
admin.site.register(Order)



