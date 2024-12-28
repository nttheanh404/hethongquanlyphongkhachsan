# Generated by Django 5.1.3 on 2024-12-24 01:36

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default=True, max_length=50, unique=True)),
                ('price', models.DecimalField(decimal_places=2, default=True, max_digits=10)),
                ('is_available', models.BooleanField(default=True)),
                ('status', models.CharField(choices=[('available', 'Available'), ('booked', 'Booked'), ('maintenance', 'Maintenance')], max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='RoomType',
            fields=[
                ('type_id', models.AutoField(primary_key=True, serialize=False)),
                ('type_name', models.CharField(choices=[('DeluxeDouble', 'DeluxeDouble'), ('ExecutiveDouble', 'ExecutiveDouble'), ('JuniorSuiteDouble', 'JuniorSuiteDouble')], max_length=50)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('phone_number', models.CharField(blank=True, max_length=15, null=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Employee',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('role', models.CharField(choices=[('admin', 'Admin'), ('staff', 'Staff')], max_length=50)),
                ('name', models.CharField(max_length=255)),
                ('contact_info', models.CharField(blank=True, max_length=255, null=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Booking',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('check_in_date', models.DateField()),
                ('check_out_date', models.DateField()),
                ('status', models.CharField(choices=[('Pending', 'Pending'), ('Confirmed', 'Confirmed'), ('Cancelled', 'Cancelled')], default='Pending', max_length=20)),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='home.customer')),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='home.room')),
            ],
        ),
        migrations.AddField(
            model_name='room',
            name='room_types',
            field=models.ForeignKey(default=True, on_delete=django.db.models.deletion.CASCADE, to='home.roomtype'),
        ),
    ]
