from django.shortcuts import render
from rest_framework import viewsets
from .serializers import AdminSerializer, LogSerializer, PurchaseSerializer, CommentSerializer, OrderSerializer, To_doSerializer, AbuseSerializer, BugSerializer
from .models import Admin
# Create your views here.

class AdminViewSet(viewsets.ModelViewSet):
    queryset = Admin.objects.all().order_by('role')
    serializer_class = AdminSerializer