from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from db.dbLinker import *


@csrf_exempt
def taskView(request):
    if request.method == "POST":
        rqst = request.POST

        if "add" in rqst:
            content = rqst["add"]
            Task(None).create(content)

        else:
            for i in ["edit", "complete", "delete"]:
                if i in rqst:
                    task = Task(rqst[i])

                    if "edit" == i:
                        content = rqst["content"]
                        task.edit(content)
                    if "complete" == i:
                        task.complete()
                    if "delete" == i:
                        task.delete()

                    break

    return JsonResponse(getTasks())
