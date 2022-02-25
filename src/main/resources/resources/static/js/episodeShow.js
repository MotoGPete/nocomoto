

 $('#submitForm').submit(function(e) {
    // reference to form object
var form = this;
    // for stopping the default action of element
    e.preventDefault();
    // mapthat will hold form data
    var formData = {}
//iterate over form elements   
    $.each(this, function(i, v){
    var input = $(v);
    // populate form data as key-value pairs
        // with the name of input as key and its value as value
    formData[input.attr("name")] = input.val();
    });
    $.ajax({
        type: form.attr('method'), // method attribute of form
        url: form.attr('action'),  // action attribute of form
        dataType : 'json',
    // convert form data to json format
        data : JSON.stringify(formData),
    });
});