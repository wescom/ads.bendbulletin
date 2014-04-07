# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#jQuery ->
#  $('#upload_uploaded_file').attr('name','upload[job_file]')
#  $('#job_file_file').fileupload
#    dataType: 'script'
#    add: (e, data) ->
#      file = data.files[0]
#      $('#new_upload').append(data.context)
#      data.submit()

#jQuery ->
#	$('#job_file_file').fileupload ({
#		dataType: 'json', 
#		done: (e, data) -> 
#			file = data.result 
#			console.log( data.textStatus, file.id, file.thumb, file.file_file_size ) 
#		fail: (e, data) -> alert 'Upload failed'

$(document).ready ->

	# trigger file upload browser on Browse click 
	$('#dropzone .browse').click () -> 
		$('#upload_file').click() 

	$('#upload_file').fileupload ({
		dataType: 'json', 
		
		# this element will accept file drag/drop uploading 
		dropZone: $('#dropzone'), 
		
		add: (e, data) -> 
			tpl = $('<li class="upload_file_box text-center"><input type="text" value="0" data-width="48" data-height="48"'+ 
			' data-fgColor="#0788a5" data-readOnly="1" data-bgColor="#3e4043" /><p></p></li>') 
		
			# Append the file name and file size 
			tpl.find("p").text(data.files[0].name).append "<br/><i> " + 
				formatFileSize(data.files[0].size) + "</i>" + "<span class='pull-right icon-remove file_remove_icon'></span>"
			# Add the HTML to the UL element 
			data.context = tpl.appendTo('#upload') 
			# Initialize the knob plugin 
			tpl.find("input").knob() 
			# Listen for clicks on the cancel icon 
			tpl.find("span").click -> 
				jqXHR.abort() if tpl.hasClass("working") 
				tpl.fadeOut -> 
					tpl.remove() 
			
			#Automatically upload the file once it is added to the queue 
			jqXHR = data.submit() 
			
		progress: (e, data) -> 
			# Calculate the completion percentage of the upload 
			progress = parseInt(data.loaded / data.total * 100, 10) 
			# Update the hidden input field and trigger a change 
			# so that the jQuery knob plugin knows to update the dial 
			data.context.find("input").val(progress).change() 
			data.context.removeClass "working" if progress is 100 
			
		fail: (e, data) -> 
			data.context.addClass "Upload Failed" 
		}) 
			
	formatFileSize = (bytes) -> 
		return "" if typeof bytes isnt "number" 
		return (bytes / 1000000000).toFixed(2) + " GB" if bytes >= 1000000000 
		return (bytes / 1000000).toFixed(2) + " MB" if bytes >= 1000000 
		return (bytes / 1000).toFixed(2) + " KB" 
		
		# Prevent the default action when a file is dropped on the window 
		$(document).on "drop dragover", (e) -> 
			e.preventDefault()