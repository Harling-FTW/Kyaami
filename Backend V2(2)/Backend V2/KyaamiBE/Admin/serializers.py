from rest_framework import Serializers
from .models import Admin, Log_Record, Purchase, Comment, Order, To_do_list, Abuse_reports, Bug_reports

class AdminSerializer(Serializers.ModelSerializer):
    class Meta:
        model = Admin
        fields = ['admin_id' , 'level', 'cell_no', 'email', 'admin']

class LogSerializer(Serializers.ModelSerializer):
    class Meta:
        model = Log_Record
        fields  = ['location', 'device', 'username', 'time', 'login_no']