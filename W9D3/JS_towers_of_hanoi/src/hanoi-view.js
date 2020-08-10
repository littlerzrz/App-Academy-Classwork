class HanoiView {
    constructor(game, $el) {
        this.game = game;
        this.$el = $el;
        this.setupTowers();
        this.render();
    }

    setupTowers() {
        this.$el.empty();

        let $tower, $disk;

        for (let towerIdx = 0; towerIdx < 3; towerIdx++) {
            $tower = $('<ul>');

            for (let diskIdx = 0; diskIdx < 3; diskIdx++) {
                $disk = $('<li>');
                $tower.append($disk);
            }

            this.$el.append($tower);
        }

}

module.exports = HanoiView;