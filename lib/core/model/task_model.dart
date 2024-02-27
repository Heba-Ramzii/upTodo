
class TaskModel {
  TaskModel({
    this.id,
    this.des,
    this.title,
    this.date,
    this.category,
    this.priority,
    this.completed = false,
  });

   int? id;
   String? title;
   String? des;
   String? date;
   String? category;
   String? priority;
   bool? completed;

  TaskModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    title = json['title'];
    des = json['des'];
    date = json['date'];
    category = json['category'];
    priority = json['priority'];
    completed = json['completed'];



  }

  Map<String, dynamic> toJson()
  {
    return
      {
        'id' : id,
        'title' : title,
        'des' : des,
        'date' : date.toString(),
        'category' : category,
        'priority' : priority,
        'completed' : completed,
      };
  }
}
