class FollowToggle {
    constructor($el){
        this.userId = $el.data("userId");
        this.followState = $el.data("initialFollowState");
        this.$el = $el;
        this.render();
        this.$el.on('click', this.handleClick.bind(this));
    }

    render() {
        if (this.followState === 'unfollowed') {
            this.$el.text("Follow!")
        } else {
            this.$el.text('Unfollow!')
        };
    }

    handleClick(e) {
        e.preventDefault();
        $.ajax({
            url: "/users/:id/follow",
            method: this.followState === 'unfollowed' ? "POST" : "DELETE",
            dataType: 'json',
            success: function() {
                if (this.followState === 'unfollowed') {
                    this.followState = 'followed'
                } else {
                    this.followState = 'unfollowed'
                }
                this.render()
            }
        }.bind(this)
        )
        
        
    }
    
    
}

module.exports= FollowToggle;


// if (this.followState === 'unfollowed') {
//     $.ajax({
//         url: "/users/:id/follow",
//         method: 'POST'

//     }.bind(this)
//     )
// } else {
//      $.ajax({
//         url: "/users/:id/follow",
//         method: 'DELETE'

//     }.bind(this)
//     )
// }