#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/maxl/demo01_ws/src/turtlebot3/turtlebot3_teleop"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/maxl/demo01_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/maxl/demo01_ws/install/lib/python2.7/dist-packages:/home/maxl/demo01_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/maxl/demo01_ws/build" \
    "/usr/bin/python2" \
    "/home/maxl/demo01_ws/src/turtlebot3/turtlebot3_teleop/setup.py" \
     \
    build --build-base "/home/maxl/demo01_ws/build/turtlebot3/turtlebot3_teleop" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/maxl/demo01_ws/install" --install-scripts="/home/maxl/demo01_ws/install/bin"
