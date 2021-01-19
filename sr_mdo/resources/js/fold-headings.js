function isOutRange(bro, dom) {
  if (bro[0] === "H") return bro.tagName >= dom.tagName;
  return false;
}

function fold(dom) {
  let brothers = $(dom).nextAll();
  for (let i = 0; i < brothers.length && !isOutRange(brothers[i], dom); i++)
    $(brothers).addClass("hide");
  $(dom).addClass("fold");
}

function unfold(dom) {
  let brothers = $(dom).nextAll();
  for (let i = 0; i < brothers.length && !isOutRange(brothers[i], dom); i++)
    $(brothers).removeClass("hide");
  $(dom).removeClass("fold");
}

function foldHeading(dom) {
  if ($(dom).hasClass("fold")) unfold(dom);
  else fold(dom);
}

$("h2,h3,h4").each((i, h) => {
  $(h).bind("click", () => foldHeading(h));
});
