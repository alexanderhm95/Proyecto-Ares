from django.shortcuts import render, render

def homePage(request):
    return render(request, 'home_page.html', locals())
