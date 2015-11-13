class JobsController < ApplicationController
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    def index
        if (params[:title] or params[:location]) 
            @jobs=Job.where('title Like ? and location Like ? and deadline >= ?',"%#{params[:title]}%","%#{params[:location]}%",Time.now.to_date).page(params[:page]).per(3)
        else
            @jobs=Job.where('deadline >= ?',Time.now.to_date).page(params[:page]).per(3)
        end
    end
    def new
       @job=Job.new
    end
    def create
       @job=Job.new(job_params)
       if @job.save
         redirect_to jobs_path
      else
         render :new
       end
    end
    def show
    end
    def edit
    end
    def update
        if @job.update(job_params)
           render :show
        else
           render :edit
        end       
    end
    def destroy
        @job.destroy
    end
    private
       def set_job
          @job = Job.find(params[:id])
       end
       def job_params
          params.require(:job).permit(:title,:job_type,:job_name,:company_name,:location,:url,:description,:apply_information,:deadline)
       end
end
