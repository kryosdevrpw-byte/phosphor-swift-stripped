KEEP=(
  fan pipe snowflake package fire oven lightbulb wifi-high
  washing-machine bathtub pill barbell drop heart bed timer
  tooth first-aid first-aid-kit eye brain scales person-simple-run
  person-simple-walk flower-lotus prescription cat dog fish bird
  tray fork-knife cooking-pot bread egg coffee cookie pizza
  pint-glass shopping-cart brandy cheers plant leaf sun cloud-rain
  flower flower-tulip tree car bicycle car-profile trash broom
  towel t-shirt handbag phone battery-full printer camera
  headphones game-controller book books clipboard-text pencil
  smiley hand-tap person toilet-paper hand-soap credit-card money
  calendar cigarette baby baby-carriage wrench clock check-circle
  repeat squares-four square-split-horizontal
)

SVG_DIR="Sources/PhosphorSwift/Resources/Assets.xcassets/SVG"

declare -A KEEP_MAP
for icon in "${KEEP[@]}"; do
  KEEP_MAP["${icon}-duotone.imageset"]=1
done

deleted=0
for dir in "$SVG_DIR"/*/; do
  name=$(basename "$dir")
  if [[ -z "${KEEP_MAP[$name]}" ]]; then
    rm -rf "$dir"
    ((deleted++))
  fi
done

echo "Deleted $deleted imagesets. Remaining:"
ls "$SVG_DIR" | wc -l
