class DBTable {
  //------------------MEMBER TABLE ---------------------------
  static const String TBL_MEMBER_NAME = "members";

  static const String COL_ID_MEMBER = "id";
  static const String COL_NAME_MEMBER = "name";
  static const String COL_SPECIAL_MEMBER = "special";

//------------------TASK TABLE-------------------------------
  static const String TBL_TASK_NAME = "tasks";

  static const String COL_ID_TASK = "id";
  static const String COL_TITLE_TASK = "title";
  static const String COL_BODY_TASK = "body";
  static const String COL_DATE_TASK = "date";
  static const String COL_IS_DONE_TASK = "isDone";
  static const String COL_TIME_TO_DO_TASK = "timeToDo";

//------------------------TASK_MEMBER TABLE ---------------------
  static const String TBL_TASK_MEMBER_NAME = "tasks_members";

  static const String COL_ID_TASK_MEMBER = "id";
  static const String COL_FID_MEMBER = "member_id";
  static const String COL_FID_TASK = "task_id";
}
