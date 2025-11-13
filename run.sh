echo "Starting..."
cd /home/mgrm1/mgrm1_cv_link
echo "Navigated to CV"
echo "Activating cv..."
source venv/bin/activate
python cv.py &
CV_LINK=$!
echo "CV activated"
deactivate

echo "Activating UI..."
flutter-pi --rotation 90 /home/mgrm1/flutter_assets/
FLUTTER_UI=$!
echo "Activated UI"
deactivate

trap "kill $CV_LINK $FLUTTER_UI" SIGINT
wait