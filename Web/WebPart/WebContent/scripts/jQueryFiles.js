function include_jQueryFilesToPage() {
	var siteAddress = '/Web/';

	include_script(siteAddress + 'scripts/coolmenus3.js');
	include_script(siteAddress + 'scripts/coolmenu-config.js');
	include_script(siteAddress + 'scripts/jquery.validate.js');
	include_script(siteAddress + 'scripts/jquery.numeric.js');
	include_script(siteAddress + 'scripts/jquery.numeric.pack.js');
	include_script(siteAddress + 'scripts/comum.js');
	
	include_script(siteAddress + 'scripts/jquery-ui.js');
	include_script(siteAddress + 'scripts/jquery-ui-timepicker-addon.js');

	include_script(siteAddress + 'scripts/jquery.blockUI.js');

	include_css(siteAddress + 'css/padrao.css');
	include_css(siteAddress + 'css/displaytag.css');
	include_css(siteAddress + 'css/jquery-ui-timepicker-addon.css');
	include_css(siteAddress + 'css/jquery_ui_datepicker.css');
};

function include_css(arquivo) {
	if (document.getElementById(arquivo))
		return;
	
	var head = document.getElementsByTagName('head')[0];

	var link = document.createElement('link');
	link.rel = 'stylesheet';
	link.id = arquivo;
	link.type = 'text/css';
	link.href = arquivo;
	link.media = 'all';
	head.appendChild(link);
};

function include_script(arquivo) {
	if (document.getElementById(arquivo))
		return;

	var head = document.getElementsByTagName('head')[0];

	document.write('<script type="text/javascript" id="' + arquivo
			+ '" src="' + arquivo + '"></script>');
};

include_jQueryFilesToPage();