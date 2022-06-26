from django.db import models
#from ..User.models import User 
import uuid
#NEED TO IMPORT USER FROM THE USER APP
# Create your models here.
class Partner(models.Model):
    #partner_id = models.ForeignKey(User, on_delete=models.CASCADE)
    partner = models.CharField(max_length=16)
    email  = models.EmailField(max_length=32)
    cell_no = models.SmallIntegerField()
    _class = models.CharField(max_length=16)

class Distributor(models.Model):
    distributor = models.CharField(max_length=16)
    email  = models.EmailField(max_length=32)
    cell_no = models.SmallIntegerField()
    distributor_id = models.UUIDField(primary_key=True,default = uuid.uuid4)

class Content(models.Model):
    genre = models.CharField(max_length=16)
    format = models.CharField(max_length=16)
    #item = models.ImageField()
    link = models.URLField()
    distributor = models.CharField(max_length=16)
    distributor_id= models.UUIDField()
    producer = models.IntegerField()
    producer_id= models.ForeignKey(Distributor, on_delete=models.CASCADE)
    content_id = models.UUIDField(primary_key=True,default = uuid.uuid4)


class Like(models.Model):
    reference = models.URLField()
    user = models.CharField(max_length=16)
    #user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    like_id = models.UUIDField(primary_key=True,default = uuid.uuid4)

class Upload(models.Model):
    producer = models.IntegerField()
    distributor= models.IntegerField()
    content_id= models.ForeignKey(Content, on_delete=models.CASCADE)
    upload_id = models.UUIDField(primary_key=True,default = uuid.uuid4)
