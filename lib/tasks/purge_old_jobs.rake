namespace :ad_upload do
  desc "Delete old jobs"
  task :delete_old_jobs  => :environment do

    def delete_jobs
      purge_date = Date.today - 30
#      puts purge_date.to_s

      @jobs = Job
      @jobs = @jobs.where('updated_at <= ?', purge_date)
      puts @jobs.count.to_s+" Jobs to Purge older than " + purge_date.to_s

      @jobs.each do |job|
        puts "Purged job #"+job.id.to_s + " - " + job.name+" - "+ job.updated_at.to_s
        #job.destroy
      end
    end

  delete_jobs

  end
end