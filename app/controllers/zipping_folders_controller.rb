require 'rubygems'
require 'zip'
class ZippingFoldersController < ApplicationController
  def new; end
  def create
    if params[:files].present?
      get_variables_for_zip(params)
      buffer = Zip::OutputStream.write_buffer(::StringIO.new(''), Zip::TraditionalEncrypter.new(@password)) do |out|
                @input_filenames.each do |filename|
                  out.put_next_entry(filename)
                  out.write File.open("#{@folder}/#{filename}").read
                end
               end

       File.open(@zipfile_name, 'wb') {|f| f.write(buffer.string) }
       buffer.rewind
       send_data buffer.read, filename: "#{@zipfile_name}.zip"
    end
  end

  private

  def get_variables_for_zip(params)
    @input_filenames = []
    params[:files].select {|f| @input_filenames << f.path.gsub('/tmp/', '') }
    @folder = "/tmp/"
    @zipfile_name = params[:out_name]
    @password = params[:password]
  end
end
