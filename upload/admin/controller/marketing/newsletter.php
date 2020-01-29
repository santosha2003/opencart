<?php
class ControllerMarketingNewsletter extends Controller {

	private $error = array();

	public function index() {
		$this->load->language('marketing/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('marketing/newsletter');

		$this->model_marketing_newsletter->createNewsletter();

		$this->getList();
	}

	public function add() {
		$this->load->language('marketing/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('marketing/newsletter');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_marketing_newsletter->addNewsletter($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('marketing/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('marketing/newsletter');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_marketing_newsletter->editNewsletter($this->request->get['news_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('marketing/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('marketing/newsletter');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $news_id) {
				$this->model_marketing_newsletter->deleteNewsletter($news_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'subscribe_date';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . $url, true)
			);

        $data['export_csv'] = $this->url->link('marketing/newsletter/exportCSV', 'token=' . $this->session->data['token'] . $url, true);
		$data['add'] = $this->url->link('marketing/newsletter/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('marketing/newsletter/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['newsletters'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
			);

		$newsletter_total = $this->model_marketing_newsletter->getTotalNewsletters();

		$results = $this->model_marketing_newsletter->getNewsletters($filter_data);

		foreach ($results as $result) {
			$data['newsletters'][] = array(
				'news_id'  => $result['news_id'],
				'news_email'       => $result['news_email'],
				'subscribe_date' => date($this->language->get('date_format_short'), strtotime($result['subscribe_date'])),
				'edit'       => $this->url->link('marketing/newsletter/edit', 'token=' . $this->session->data['token'] . '&news_id=' . $result['news_id'] . $url, true)
				);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_news_id'] = $this->language->get('column_news_id');
		$data['column_news_email'] = $this->language->get('column_news_email');
		$data['column_subscribe_date'] = $this->language->get('column_subscribe_date');
		$data['column_action'] = $this->language->get('column_action');

        $data['button_export_csv'] = $this->language->get('button_export_csv');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_news_id'] = $this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . '&sort=news_id' . $url, true);
		$data['sort_news_email'] = $this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . '&sort=news_email' . $url, true);
		$data['sort_subscribe_date'] = $this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . '&sort=subscribe_date' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}


		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$pagination = new Pagination();
		$pagination->total = $newsletter_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($newsletter_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($newsletter_total - $this->config->get('config_limit_admin'))) ? $newsletter_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $newsletter_total, ceil($newsletter_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('marketing/newsletter_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['news_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$data['entry_news_email'] = $this->language->get('entry_news_email');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['news_id'])) {
			$data['news_id'] = $this->request->get['news_id'];
		} else {
			$data['news_id'] = 0;
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['news_email'])) {
			$data['error_news_email'] = $this->error['news_email'];
		} else {
			$data['error_news_email'] = '';
		}

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . $url, true)
			);

		if (!isset($this->request->get['news_id'])) {
			$data['action'] = $this->url->link('marketing/newsletter/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('marketing/newsletter/edit', 'token=' . $this->session->data['token'] . '&news_id=' . $this->request->get['news_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('marketing/newsletter', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['news_id']) && (!$this->request->server['REQUEST_METHOD'] != 'POST')) {
			$newsletter_info = $this->model_marketing_newsletter->getNewsletter($this->request->get['news_id']);
		}

		if (isset($this->request->post['news_email'])) {
			$data['news_email'] = $this->request->post['news_email'];
		} elseif (!empty($newsletter_info)) {
			$data['news_email'] = $newsletter_info['news_email'];
		} else {
			$data['news_email'] = '';
		}

		if (isset($this->request->post['subscribe_date'])) {
			$data['subscribe_date'] = $this->request->post['subscribe_date'];
		} elseif (!empty($newsletter_info)) {
			$data['subscribe_date'] = ($newsletter_info['subscribe_date'] != '0000-00-00' ? $newsletter_info['subscribe_date'] : '');
		} else {
			$data['subscribe_date'] = date('Y-m-d', time());
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('marketing/newsletter_form', $data));
	}

	protected function validateForm() {

		if (!$this->user->hasPermission('modify', 'marketing/newsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['news_email']) > 96) || (!filter_var($this->request->post['news_email'], FILTER_VALIDATE_EMAIL))) {
			$this->error['news_email'] = $this->language->get('error_news_email');

		}

		$email = $this->model_marketing_newsletter->getNewsletterEmail($this->request->post['news_email']);

		if ($this->request->post['news_email'] == isset($email['news_email'])) {
			$this->error['news_email'] = $this->language->get('error_news_email_duplicate');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'marketing/newsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function exportCSV() {
        $this->load->model('marketing/newsletter');

        $temp_data = $this->model_marketing_newsletter->getNewsletters();

        /* CSV Header Starts Here */
        header("Content-Type: text/csv");
        header("Content-Disposition: attachment; filename=NewslettersCSV-".date('d-m-Y').".csv");
        // Disable caching
        header("Cache-Control: no-cache, no-store, must-revalidate"); // HTTP 1.1
        header("Pragma: no-cache"); // HTTP 1.0
        header("Expires: 0"); // Proxies
        /* CSV Header Ends Here */
        $output = fopen("php://output", "w");

        $data = array();

        foreach($temp_data as $data)
        {
            $data = array(
                'news_id' =>$data['news_id'],
                'news_email' =>$data['news_email'],
                'subscribe_date' =>$data['subscribe_date'],
            );
            fputcsv($output, $data);
        }
        fclose($output);
    }
}	