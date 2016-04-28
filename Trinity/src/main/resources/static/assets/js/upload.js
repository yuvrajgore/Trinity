$("#upload").click(function(){
		$("#fileUpload").modal("show");	
	});
	
	var i=1;

	  function readBlob(upload,range,content) {

	    var files = document.getElementById(upload).files;
	    console.log(files.length);
	    if (!files.length) {
	      alert('Please select a file!');
	      $("#"+content).text("");
	      $("#"+range).text("File not chosen");
	      return;
	    }

	    var file = files[0];
	    var start = 0;
	    var stop = file.size - 1;

	    var reader = new FileReader();

	    // If we use onloadend, we need to check the readyState.
	    reader.onloadend = function(evt) {
	      if (evt.target.readyState == FileReader.DONE) { // DONE == 2
	        $("#"+content).text(evt.target.result);
	        $("#"+range).text(['Read bytes: ', start + 1, ' - ', stop + 1,
	             ' of ', file.size, ' byte file'].join(''));

	      }
	    };

	    var blob = file.slice(start, stop + 1);
	    reader.readAsBinaryString(blob);

	  }
	  
	  $("body").on("change",".file-upload",function(){
	  		
	      var upload = $(this).attr("id");
	      var range = $(this).parent().find(".file_range").attr("id");
	      var content = $(this).parent().find(".file_content").attr("id");
	      var str1 = parseInt(range.substring(10));
	      

	      readBlob(upload,range,content);

	      if(str1 == i){
	          i = i + 1;
	          var str = "<div class='form-group' id='get-files"+i+"'>" +
						"<label class='label-control col-md-3'>Upload File<span class='required'> * </span></label>"+
						"<div class='col-md-9'>";
	           str = str + "<input type='file' class='file-upload' id='files"+i+"' name='file' /> Read bytes: "+
	         		"<div class='file_range' id='byte_range"+i+"'></div><div class='file_content' id='byte_content"+i+"'></div></div></div>";
	          $("body").find("#get-files"+(i-1)).parent().append(str);
	          
	      }
	  });