from django.db import models

# Create your models here.
from django_tenants.models import TenantMixin, DomainMixin
from django_tenants.utils import get_tenant_type_choices

class Client(TenantMixin):
    name = models.CharField(max_length=100)
    paid_until =  models.DateField()
    on_trial = models.BooleanField()
    created_on = models.DateField(auto_now_add=True)
    type = models.CharField(max_length=100, choices=get_tenant_type_choices(), default='public', blank=True)


class Domain(DomainMixin):
    pass
