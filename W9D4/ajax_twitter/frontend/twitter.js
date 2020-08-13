const FollowToggle = require("./follow_toggle")

$(() => {
    $("button.follow-toggle").each(function() {
        let button = new FollowToggle(this);
        
    });
})