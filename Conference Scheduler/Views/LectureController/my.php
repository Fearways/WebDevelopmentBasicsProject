<div class="row">
    <?php
    if(count($this->_viewBag['body']->getLectures()) < 1) {
        ?> <h1 class="alert alert-info text-center">You are not registered for any lectures!</h1> <?php
    } else {
    foreach ($this->_viewBag['body']->getLectures() as $lecture) :?>
        <div class="blueish panel panel-info col-md-5 margin-right">
            <div class="panel-body">
                <div class="block">
                    <a class="panel panel-danger col-sm-4 btn btn-default text-center"
                       href="/lecture/<?= $lecture->getId() ?>/show/0/3"><?= $lecture->getName() ?></a>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;<i><?= $lecture->getDescription() ?></i></p>
                </div>
                <div class="block margin-top">
                    <p><b>Start:</b> <?= date_format(date_create($lecture->getStart()), 'd F Y H:i')?></p>
                    <p><b>End:</b> <?= date_format(date_create($lecture->getEnd()), 'd F Y H:i') ?></p>
                    <p><b>Speaker:</b> <?= $lecture->getSpeaker() ?></p>
                    <p><b>Conference:</b> <?= $lecture->getConference() ?></p>
                    <p><b>Hall:</b> <?= $lecture->getHall() ?></p>
                </div>
                <?php if(\Framework\App::getInstance()->isLogged()) :?>
                    <a class="margin-right btn btn-danger col-sm-3 text-center"
                       href="/lecture/unregisterLecture/<?= $lecture->getId() ?>/unregister">Unregister</a>
                <?php endif; ?>
            </div>
        </div>
    <?php endforeach; ?>
    <?php } ?>
</div>