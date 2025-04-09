module mymodule;

import <FL/Fl.H>;
import <FL/Fl_Button.H>;
import <FL/Fl_Group.H>;
import <FL/Fl_Window.H>;
import <FL/fl_draw.H>;
import <FL/Fl_Radio_Button.H>;
import <FL/Fl_Toggle_Button.H>;
Fl_Widget_Tracker** Fl_Button.key_release_tracker = 0;

// There are a lot of subclasses, named Fl_*_Button.  Some of
// them are implemented by setting the type() value and testing it
// here.  This includes Fl_Radio_Button and Fl_Toggle_Button
int Fl_Button.value(int v) {
  v = v ? 1 : 0;
  oldval = v;
  clear_changed();
  if (value_ != v) {
    value_ = v;
    if (box()) redraw();
    else redraw_label();
    return 1;
  }
  else {
    return 0;
  }
}

void Fl_Button.setonly() {
  value(1);
  Fl_Group * g = parent();
  Fl_Widget** a = g.array();
  for (int i = g.children();
  ; i; ) {
    Fl_Widget * o = ;
    if (o != this && o.type() == FL_RADIO_BUTTON) value(0);
  }
}

void Fl_Button.draw() {
  if (type() == FL_HIDDEN_BUTTON) return;
  Fl_Color col = value() ? selection_color() : color();
  Fl_Boxtype bt = value() ? down_box() ? down_box() : fl_down(box()) : box();
  if (compact_ && parent()) {
    Fl_Widget * p = parent();
    int px, py, pw = p.w(), ph = p.h();
    if (p.as_window()) {
      px = 0;
      py = 0;
    }
    else {
      px = p.x();
      py = p.y();
    }
    fl_push_clip(x(), y(), w(), h());
    draw_box(bt, px, py, pw, ph, col);
    fl_pop_clip();
    int hh = 5, ww = 5;
    Fl_Color divider_color = fl_gray_ramp(FL_NUM_GRAY / 3);
    if () divider_color = fl_inactive(divider_color);
    if (x() + w() != px + pw) {
      fl_color(divider_color);
      fl_yxline(x() + w() - 1, y() + hh, y() + h() - 1 - hh);
    }
    if (y() + h() != py + ph) {
      fl_color(divider_color);
      fl_xyline(x() + ww, y() + h() - 1, x() + w() - 1 - ww);
    }
  }
  else {
    draw_box(bt, col);
  }
  draw_backdrop();
  if (labeltype() == FL_NORMAL_LABEL && value()) {
    Fl_Color c = labelcolor();
    labelcolor(fl_contrast(c, col));
    draw_label();
    labelcolor(c);
  }
  else draw_label();
  if (Fl.focus() == this) draw_focus();
}

int Fl_Button.handle(int event) {
  int newval;
  switch (event) {
    case FL_ENTER:
    case FL_LEAVE:
      return 1;
    case FL_PUSH:
      if (Fl.visible_focus() && handle(FL_FOCUS)) Fl.focus(this);
    case FL_DRAG:
      if (Fl.event_inside(this)) {
        if (type() == FL_RADIO_BUTTON) newval = 1;
        else newval = ;
      }
      else {
        clear_changed();
        newval = oldval;
      }
      if (newval != value_) {
        value_ = newval;
        set_changed();
        redraw();
        if (when() & FL_WHEN_CHANGED) do_callback(FL_REASON_CHANGED);
      }
      return 1;
    case FL_RELEASE:
      if (value_ == oldval) {
        if (when() & FL_WHEN_NOT_CHANGED) do_callback(FL_REASON_SELECTED);
        return 1;
      }
      set_changed();
      if (type() == FL_RADIO_BUTTON) setonly();
      else if (type() == FL_TOGGLE_BUTTON) oldval = value_;
      else {
        value(oldval);
        set_changed();
        if (when() & FL_WHEN_CHANGED) {
          Fl_Widget_Tracker wp;
          do_callback(FL_REASON_CHANGED);
          if (wp.deleted()) return 1;
        }
      }
      if (when() & FL_WHEN_RELEASE) do_callback(FL_REASON_RELEASED);
      return 1;
    case FL_SHORTCUT:
      if () return 0;
      if (Fl.visible_focus() && handle(FL_FOCUS)) Fl.focus(this);
      goto triggered_by_keyboard;
    case FL_FOCUS:
    case FL_UNFOCUS:
      if (Fl.visible_focus()) {
        if (box() == FL_NO_BOX) {
          int X = x() > 0 ? x() - 1 : 0;
          int Y = y() > 0 ? y() - 1 : 0;
          if (window()) window().damage(FL_DAMAGE_ALL, X, Y, w() + 2, h() + 2);
        }
        else redraw();
        return 1;
      }
      else return 0;
    case FL_KEYBOARD:
      if (Fl.focus() == this && Fl.event_key() == ' ' && ) {
        triggered_by_keyboard:
        if (type() == FL_RADIO_BUTTON) {
          if () {
            setonly();
            set_changed();
            if (when() & FL_WHEN_CHANGED) do_callback(FL_REASON_CHANGED);
            else if (when() & FL_WHEN_RELEASE) do_callback(FL_REASON_RELEASED);
          }
          else {
            if (when() & FL_WHEN_NOT_CHANGED) do_callback(FL_REASON_SELECTED);
          }
        }
        else if (type() == FL_TOGGLE_BUTTON) {
          value();
          set_changed();
          if (when() & FL_WHEN_CHANGED) do_callback(FL_REASON_CHANGED);
          else if (when() & FL_WHEN_RELEASE) do_callback(FL_REASON_RELEASED);
        }
        else {
          simulate_key_action();
          value(1);
          if (when() & FL_WHEN_CHANGED) {
            set_changed();
            Fl_Widget_Tracker wp;
            do_callback(FL_REASON_CHANGED);
            if (wp.deleted()) return 1;
            value(0);
            set_changed();
            do_callback(FL_REASON_RELEASED);
          }
          else if (when() & FL_WHEN_RELEASE) {
            value(0);
            set_changed();
            do_callback(FL_REASON_RELEASED);
          }
        }
        return 1;
      }
    default:
      return 0;
  }
}

void Fl_Button.simulate_key_action() {
  if (key_release_tracker) {
    Fl.remove_timeout(key_release_timeout, key_release_tracker);
    key_release_timeout(key_release_tracker);
  }
  value(1);
  redraw();
  key_release_tracker = new Fl_Widget_Tracker;
  Fl.add_timeout(0.15, key_release_timeout, key_release_tracker);
}

void Fl_Button.key_release_timeout(void* d) {
  Fl_Widget_Tracker * wt = cast(Fl_Widget_Tracker) d;
  if () return;
  if (wt == key_release_tracker) key_release_tracker = 0L;
  Fl_Button * btn = cast(Fl_Button) wt.widget();
  if (btn) {
    btn.value(0);
    btn.redraw();
  }
  delete wt;
}

Fl_Button.this(int X, int Y, int W, int H, const char* L) {
  box(FL_UP_BOX);
  set_flag(SHORTCUT_LABEL);
}

Fl_Radio_Button.this(int X, int Y, int W, int H, const char* L) {
  type(FL_RADIO_BUTTON);
}

MySpace.Fl_Toggle_Button.this(int X, int Y, int W, int H, const char* L) {
  type(FL_TOGGLE_BUTTON);
}

void Fl_Button.compact(uchar v) {
  compact_ = v;
}

