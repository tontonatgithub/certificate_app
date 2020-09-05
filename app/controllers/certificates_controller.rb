class CertificatesController < ApplicationController
  def index
    @certificates = Certificate.all
  end

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = Certificate.new(certificate_params)
    
    if @certificate.save
      # 保存の成功をここで扱う。
      ImageHelper.build("#{@certificate.content}".lines(chomp: true).join)
      ImageHelper.build2("#{@certificate.my_name}")
      ImageHelper.build3("#{@certificate.your_name}")
      ImageHelper.write(title_style, @certificate.id)
      redirect_to @certificate
    else
      render "new"
    end
  end

  def show
    @certificate = Certificate.find(params[:id])
  end
  
  private
    def certificate_params
      params.require(:certificate).permit(:my_name, :your_name, :content, :style)
    end
    
    def title_style
      if @certificate.style == 1
        "表彰状"
      else
        "感謝状"
      end
    end
end
