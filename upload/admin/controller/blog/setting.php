<?php
class ControllerBlogSetting extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('blog/setting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->model_setting_setting->editSettingValue('easy_blog', 'easy_blog_global_article_limit', $this->request->post['easy_blog_global_article_limit']);
            $this->model_setting_setting->editSettingValue('easy_blog', 'easy_blog_home_page_meta_title', $this->request->post['easy_blog_home_page_meta_title']);
            $this->model_setting_setting->editSettingValue('easy_blog', 'easy_blog_home_page_meta_description', $this->request->post['easy_blog_home_page_meta_description']);
            $this->model_setting_setting->editSettingValue('easy_blog', 'easy_blog_home_page_meta_keyword', $this->request->post['easy_blog_home_page_meta_keyword']);
            $this->model_setting_setting->editSettingValue('easy_blog', 'easy_blog_home_page_name', $this->request->post['easy_blog_home_page_name']);
            $this->model_setting_setting->editSettingValue('easy_blog', 'easy_blog_global_status', $this->request->post['easy_blog_global_status']);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('blog/article', 'token=' . $this->session->data['token'], true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_article_limit'] = $this->language->get('entry_article_limit');
        $data['entry_meta_title'] = $this->language->get('entry_meta_title');
        $data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['help_article_limit'] = $this->language->get('help_article_limit');
        $data['help_meta_title'] = $this->language->get('help_meta_title');
        $data['help_meta_description'] = $this->language->get('help_meta_description');
        $data['help_meta_keyword'] = $this->language->get('help_meta_keyword');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = '';
        }

        if (isset($this->error['article_limit'])) {
            $data['error_article_limit'] = $this->error['article_limit'];
        } else {
            $data['error_article_limit'] = '';
        }


        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_article'),
			'href' => $this->url->link('blog/article', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('blog/setting', 'token=' . $this->session->data['token'], true)
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['action'] = $this->url->link('blog/setting', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('blog/article', 'token=' . $this->session->data['token'], true);

		$data['token'] = $this->session->data['token'];

        if (isset($this->request->post['easy_blog_home_page_name'])) {
            $data['easy_blog_home_page_name'] = $this->request->post['easy_blog_home_page_name'];
        } else {
            $data['easy_blog_home_page_name'] = $this->config->get('easy_blog_home_page_name');
        }
        if (isset($this->request->post['easy_blog_global_status'])) {
            $data['easy_blog_global_status'] = $this->request->post['easy_blog_global_status'];
        } else {
            $data['easy_blog_global_status'] = $this->config->get('easy_blog_global_status');
        }

        if (isset($this->request->post['easy_blog_global_article_limit'])) {
            $data['easy_blog_global_article_limit'] = $this->request->post['easy_blog_global_article_limit'];
        } else {
            $data['easy_blog_global_article_limit'] = $this->config->get('easy_blog_global_article_limit');
        }

        if (isset($this->request->post['easy_blog_home_page_meta_title'])) {
            $data['easy_blog_home_page_meta_title'] = $this->request->post['easy_blog_home_page_meta_title'];
        } else {
            $data['easy_blog_home_page_meta_title'] = $this->config->get('easy_blog_home_page_meta_title');
        }

        if (isset($this->request->post['easy_blog_home_page_meta_description'])) {
            $data['easy_blog_home_page_meta_description'] = $this->request->post['easy_blog_home_page_meta_description'];
        } else {
            $data['easy_blog_home_page_meta_description'] = $this->config->get('easy_blog_home_page_meta_description');
        }

        if (isset($this->request->post['easy_blog_home_page_meta_keyword'])) {
            $data['easy_blog_home_page_meta_keyword'] = $this->request->post['easy_blog_home_page_meta_keyword'];
        } else {
            $data['easy_blog_home_page_meta_keyword'] = $this->config->get('easy_blog_home_page_meta_keyword');
        }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('blog/setting', $data));
	}

	protected function validate() {
        if (!$this->user->hasPermission('modify', 'blog/setting')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['easy_blog_global_article_limit']) {
            $this->error['article_limit'] = $this->language->get('error_article_limit');
        }

        if ((utf8_strlen($this->request->post['easy_blog_home_page_name']) < 3) || (utf8_strlen($this->request->post['easy_blog_home_page_name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
	}

}