import 'package:floor/floor.dart';


import '../entities/job_post.dart';

@dao
abstract class JobPostDao {
  @Query('SELECT * FROM job_post')
  Future<List<JobPost>> getAllJobPosts();

  @Query('SELECT * FROM job_post WHERE id = :id')
  Future<JobPost?> getJobPostById(int id);

  @insert
  Future<void> insertJobPost(JobPost jobPost);

  @update
  Future<void> updateJobPost(JobPost jobPost);

  @delete
  Future<void> deleteJobPost(JobPost jobPost);
}