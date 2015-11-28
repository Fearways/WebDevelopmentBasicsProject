<div class="row">
    <?php
        $userLectures = $this->_viewBag['body']->getUsersLectures();
        $check = false;
        foreach ($this->_viewBag['body']->getLectures() as $lecture) :?>
        <?php
        $start = strtotime($lecture->getStart());
        $end = strtotime($lecture->getEnd());
        ?>
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
                    <?php if((int)$lecture->getHallCount() === (int)$lecture->getUsersRegistered()) :?>
                        <span class="red">No more places for this lecture</span>
                    <?php endif; ?>
                    <?php if((\Framework\App::getInstance()->isLogged() && !in_array($lecture->getId(), $_SESSION['response1'])) && $lecture->getHallCount() > $lecture->getUsersRegistered()): ?>
                        <?php if(count($userLectures) < 1) :?>
                            <div class="block">
                                <a class="height32 btn btn-primary col-sm-4 text-center"
                                   href="/lecture/<?= $lecture->getId() ?>/registerForLecture">Must visit</a>
                            </div>
                        <?php endif; ?>
                        <?php if(!(count($userLectures) < 1)) :?>
                        <?php foreach($userLectures as $userLecture) :?>
                            <?php
                                $endUser = strtotime($userLecture->getEnd());
                                $startUser = strtotime($userLecture->getStart());
                            ?>
                            <?php $check = !($end <= $startUser || $start >= $endUser);
                                if($check) {
                                    break;
                                }
                            ?>
                        <?php endforeach; ?>
                            <?php if(!($check)) : ?>
                                <div class="block">
                                    <a class="height32 btn btn-primary col-sm-4 text-center"
                                       href="/lecture/<?= $lecture->getId() ?>/registerForLecture">Must visit</a>
                                </div>
                            <?php endif; ?>
                            <?php if(($check)) : ?>
                                <span class="orange">
                                    You'll attend another lecture in this time
                                </span>
                            <?php endif; ?>
                        <?php endif; ?>
                        <?php endif; ?>
                    <?php if(!(\Framework\App::getInstance()->isLogged() && !in_array($lecture->getId(), $_SESSION['response1'])) && $lecture->getHallCount() > $lecture->getUsersRegistered()): ?>
                        <div class="block"></div>
                    <?php endif; ?>
                    <p class="float-right"> <i>Registered:</i> <?php echo $lecture->getUsersRegistered(); ?>/<?php echo ($lecture->getHallCount());?></p>
                </div>
            </div>
        </div>
    <?php endforeach; ?>