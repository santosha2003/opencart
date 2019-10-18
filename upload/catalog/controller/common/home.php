<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		/*Articles*/
		$this->load->model('newsblog/article');
		
		$data['articles'] = array();
		
		$this->load->model('tool/image');
		$this->load->language('module/newsblog_articles');
		
		$filter_data = array(
					'order'              => 'ASC',
					'start'              => 0,
					'limit'              => 3
		);
		
		$results = $this->model_newsblog_article->getArticles($filter_data);

		foreach ($results as $result) {
			if ($result['image']) {
				$original	= HTTP_SERVER.'image/'.$result['image'];
 			} else {
 				$original 	= false;
 				$thumb 		= false;
 			}

 			$mainCategoryId =  $this->model_newsblog_article->getArticleMainCategoryId($result['article_id']);

			$data['articles'][] = array(
				'article_id'  		=> $result['article_id'],
				'original' 			=> $original,
				'name'        		=> $result['name'],
				'attributes'  		=> $result['attributes'],
				'href'         		=> $this->url->link('newsblog/article', 'newsblog_path=' . $mainCategoryId . '&newsblog_article_id=' . $result['article_id']),
			);
		}
		/*Articles*/

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
