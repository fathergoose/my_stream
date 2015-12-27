$(function(){
  $("#uploader").pluploadQueue({
    runtimes: 'html5',
  url:'..',
  multipart_params: {
    '<%= request_forgery_protection_token %>': '<%= form_authenticity_token %>',
  '<%= Rails.application.config.session_options[:key] %>': '<%= request.session_options[:id] %>'
  }
  });
});
