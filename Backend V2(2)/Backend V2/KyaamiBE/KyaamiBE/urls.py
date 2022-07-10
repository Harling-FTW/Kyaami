
"""KyaamiBE URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
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
from django.urls import path
from Admin import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('comment access/', views.comment_list),
    path('admin access/', views.admin_list),
    path('log access/', views.log_Record_list),
    path('purchase access/',views.purchase_list),
    path('order access/', views.order_list),
    path('todo access/', views.to_do_list),
    path('abuse access/', views.abuse_list),
    path('bug access/', views.Bug_list),
]