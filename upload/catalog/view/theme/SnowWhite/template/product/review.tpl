<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>

<div class="rew-item clearfix">
	<img class="rew-user-avatar" src="http://www.gravatar.com/avatar/">
	<div class="rew-item-meta">
		<p><span class="rew-user-name">
				<?php echo $review['author']; ?></span><span class="rew-date"><?php echo $review['date_added']; ?></span></p>
		<p class="rev-item-text">
			<?php echo $review['text']; ?>
		</p>
	</div>
</div>
<?php } ?>
<div class="text-right">
	<?php echo $pagination; ?>
</div>
<?php } else { ?>
<p>
	<?php echo $text_no_reviews; ?>
</p>
<?php } ?>
