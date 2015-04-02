class Job < ActiveRecord::Base
    validates :title, presence: { message: '請填寫招文標題' }
    validates :job_type, presence: { message: '請填寫工作類型' }
    validates :job_name, presence: { message: '請填寫工作職稱' }
    validates :company_name, presence: { message: '請填寫公司名稱' }
    validates :location, presence: { message: '請填寫公司地址' }
    validates :description, presence: { message: '請填寫招文內容' }
    validates :apply_information, presence: { message: '請填寫允許投遞資料' }
    validates :deadline, presence: { message: '請填寫截止日期' }
end
