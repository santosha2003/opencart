<div class="catalog-menu">
        <ul class="nav flex-column">
            <?php foreach($categories as $category): ?>
            <?php if($category['children']): ?>
            <li class="nav-item">
                <a class="nav-link dropdown-toggle" href="<?=$category['href'] ?>"><?=$category['name'] ?></a>
                <div class="dropdown-menu">
                    
                    <?php foreach($category['children'] as $child): ?>
                    <a class="dropdown-item" href="<?=$child['href'] ?>"><?=$child['name'] ?></a>
                    <?php endforeach; ?>
                   
                </div>
            </li>
            <?php else: ?>
            <li class="nav-item">
                <a class="nav-link" href="<?=$category['href'] ?>">
                    <?=$category['name'] ?></a>
            </li>
            <?php endif; ?>
            <?php endforeach; ?>
        </ul>
    </div>