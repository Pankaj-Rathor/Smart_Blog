/* global uid, pid */

function doLike(pid, uid) {
    const d = {
        pid: pid,
        uid: uid,
        operation: "like"
    };
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            if (data.trim() === "true") {
                $(".like-btn").css("color", "blue");
                $(".dislike-btn").css("color", "black");
                $("#li").addClass("disabled");
                $("#di").removeClass("disabled");
                let l = $(".like-counter").html();
                l++;
                let d = $(".dislike-counter").html();
                if (d > 0) {
                    d--;
                }

                $(".like-counter").html(l);
                $(".dislike-counter").html(d);
            }
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            console.log("error");
        }
    });
}


/* global uid, pid */
// Dislike modul
function doDislike(pid, uid) {
    const d = {
        pid: pid,
        uid: uid,
        operation: "dislike"
    };
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            if (data.trim() === "true") {
                $(".dislike-btn").css("color", "red");
                $(".like-btn").css("color", "black");
                $("#di").addClass("disabled");
                $("#li").removeClass("disabled");
                let d = $(".dislike-counter").html();
                d++;
                let l = $(".like-counter").html();
                if (l > 0) {
                    l--;
                }
                $(".like-counter").html(l);
                $(".dislike-counter").html(d);
            }
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            console.log("error");
        }
    });
}



