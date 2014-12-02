namespace :ad_upload do
  desc "Delete old jobs"
  task :delete_old_jobs  => :environment do

    def delete_jobs
      today = Date.today - 30
#      puts today.to_s

      @jobs = Job
      @jobs = @jobs.where('updated_at <= ?', today)
      puts @jobs.count.to_s+" Jobs to Purge: "

      @jobs.each do |job|
        puts "Job:"+job.id.to_s + " - " + job.name+" - "+ job.updated_at.to_s
      end
    end

  delete_jobs

  end
end