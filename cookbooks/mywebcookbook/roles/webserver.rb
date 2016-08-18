name "webserver"
description "Running htpp, https"
run_list(
	"recipe[apache2]",
	"recipe[apache2::mod_ssl]"
	)
	default_attributes
	"apache" => {
	"listen" =>["*:80", ""*:443"]
	
}
