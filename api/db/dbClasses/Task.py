from .Essentials import DbPath, reverseDict


def getTasks():
    
    return reverseDict(DbPath("tasks").getDb())


def updateTasks(newTasks):
    DbPath("tasks").writeToDb(newTasks)


class Task:
    def __init__(self, taskID):
        self.taskID = taskID

    def get(self):
        return getTasks()[self.taskID]

    def update(self, val):
        tasks = getTasks()
        tasks[self.taskID] = val
        updateTasks(tasks)

    #
    def create(self, content):
        tasks = getTasks()

        taskId = 0

        for i in tasks:
            val = int(i.split("task#")[1])
            if val > taskId:
                taskId = val

        taskId += 1
        taskId = f"task#{taskId}"

        tasks[taskId] = {"content": content, "completed": False}
        updateTasks(tasks)

    def edit(self, content):
        task = self.get()
        task["content"] = content
        self.update(task)

    def complete(self):
        task = self.get()
        task["completed"] = True
        self.update(task)

    def delete(self):
        tasks = getTasks()
        del tasks[self.taskID]
        updateTasks(tasks)
