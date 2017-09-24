CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";
  config.toolbar_mini =
    [

//	{ name: 'clipboard', items : [ 'Cut','Copy','Paste','-','Undo','Redo' ]},
	{ name: 'basicstyles', items : [ 'Bold','Italic','Underline'] },
	{ name: 'paragraph', items : [ 'NumberedList','BulletedList'] },
	{ name: 'colors', items : [ 'TextColor']},
	{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },
	{ name: 'insert', items : [ 'Image','Table','Smiley']},
	//{ name: 'styles', items : ['FontSize' ]},
	
];
  config.toolbar = "mini";

  // ... rest of the original config.js  ...
}