<?php 
use SemVer\version;
use SemVer\expression;
use SemVer\SemVerException;

class Semver {

	public function version($version){
		return new version($version);
	}

	public function expression($expression){
		return new expression($expression);
	}

	public function gt($v1, $v2){
		return version::gt($v1, $v2);
	}

	public function lt($v1, $v2){
		return version::lt($v1, $v2);
	}

	public function compare($v1, $v2){
		return version::compare($v1, $v2);
	}
}