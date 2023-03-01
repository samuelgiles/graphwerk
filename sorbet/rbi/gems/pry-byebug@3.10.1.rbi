# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `pry-byebug` gem.
# Please instead update this file by running `bin/tapioca gem pry-byebug`.

module Byebug
  include ::Byebug::Helpers::ReflectionHelper
  extend ::Byebug::Helpers::ReflectionHelper
  extend ::Byebug

  def displays; end
  def displays=(_arg0); end
  def init_file; end
  def init_file=(_arg0); end
  def mode; end
  def mode=(_arg0); end
  def run_init_script; end

  private

  def add_catchpoint(_arg0); end
  def breakpoints; end
  def catchpoints; end
  def contexts; end
  def current_context; end
  def debug_load(*_arg0); end
  def lock; end
  def post_mortem=(_arg0); end
  def post_mortem?; end
  def raised_exception; end
  def rc_dirs; end
  def run_rc_file(rc_file); end
  def start; end
  def started?; end
  def stop; end
  def stoppable?; end
  def thread_context(_arg0); end
  def tracing=(_arg0); end
  def tracing?; end
  def unlock; end
  def verbose=(_arg0); end
  def verbose?; end

  class << self
    def actual_control_port; end
    def actual_port; end
    def add_catchpoint(_arg0); end
    def attach; end
    def breakpoints; end
    def catchpoints; end
    def contexts; end
    def current_context; end
    def debug_load(*_arg0); end
    def handle_post_mortem; end
    def interrupt; end
    def load_settings; end
    def lock; end
    def parse_host_and_port(host_port_spec); end
    def post_mortem=(_arg0); end
    def post_mortem?; end
    def raised_exception; end
    def spawn(host = T.unsafe(nil), port = T.unsafe(nil)); end
    def start; end
    def start_client(host = T.unsafe(nil), port = T.unsafe(nil)); end
    def start_control(host = T.unsafe(nil), port = T.unsafe(nil)); end
    def start_server(host = T.unsafe(nil), port = T.unsafe(nil)); end
    def started?; end
    def stop; end
    def stoppable?; end
    def thread_context(_arg0); end
    def tracing=(_arg0); end
    def tracing?; end
    def unlock; end
    def verbose=(_arg0); end
    def verbose?; end
    def wait_connection; end
    def wait_connection=(_arg0); end

    private

    def client; end
    def control; end
    def server; end
  end
end

class Byebug::DebugThread < ::Thread
  class << self
    def inherited; end
  end
end

Byebug::PORT = T.let(T.unsafe(nil), Integer)

class Byebug::PryProcessor < ::Byebug::CommandProcessor
  def at_breakpoint(breakpoint); end
  def at_end; end
  def at_line; end
  def at_return(_return_value); end
  def bold(*args, &block); end
  def output(*args, &block); end
  def perform(action, options = T.unsafe(nil)); end
  def pry; end
  def pry=(_arg0); end
  def run(&_block); end

  private

  def n_hits(breakpoint); end
  def perform_backtrace(_options); end
  def perform_down(options); end
  def perform_finish(*_arg0); end
  def perform_frame(options); end
  def perform_next(options); end
  def perform_step(options); end
  def perform_up(options); end
  def resume_pry; end

  class << self
    def start; end
  end
end

class Byebug::ThreadsTable; end

class Pry
  extend ::Forwardable
  extend ::Pry::Forwardable

  def initialize(options = T.unsafe(nil)); end

  def add_sticky_local(name, &block); end
  def backtrace; end
  def backtrace=(_arg0); end
  def binding_stack; end
  def binding_stack=(_arg0); end
  def color(*args, &block); end
  def color=(*args, &block); end
  def commands(*args, &block); end
  def commands=(*args, &block); end
  def complete(str); end
  def config; end
  def current_binding; end
  def current_context; end
  def custom_completions; end
  def custom_completions=(_arg0); end
  def editor(*args, &block); end
  def editor=(*args, &block); end
  def eval(line, options = T.unsafe(nil)); end
  def eval_string; end
  def eval_string=(_arg0); end
  def evaluate_ruby(code); end
  def exception_handler(*args, &block); end
  def exception_handler=(*args, &block); end
  def exec_hook(name, *args, &block); end
  def exit_value; end
  def extra_sticky_locals(*args, &block); end
  def extra_sticky_locals=(*args, &block); end
  def hooks(*args, &block); end
  def hooks=(*args, &block); end
  def inject_local(name, value, binding); end
  def inject_sticky_locals!; end
  def input(*args, &block); end
  def input=(*args, &block); end
  def input_ring; end
  def last_dir; end
  def last_dir=(_arg0); end
  def last_exception; end
  def last_exception=(exception); end
  def last_file; end
  def last_file=(_arg0); end
  def last_result; end
  def last_result=(_arg0); end
  def last_result_is_exception?; end
  def memory_size; end
  def memory_size=(size); end
  def output; end
  def output=(*args, &block); end
  def output_ring; end
  def pager; end
  def pager=(*args, &block); end
  def pop_prompt; end
  def print(*args, &block); end
  def print=(*args, &block); end
  def process_command(val); end
  def process_command_safely(val); end
  def prompt; end
  def prompt=(new_prompt); end
  def push_binding(object); end
  def push_initial_binding(target = T.unsafe(nil)); end
  def push_prompt(new_prompt); end
  def quiet?; end
  def raise_up(*args); end
  def raise_up!(*args); end
  def raise_up_common(force, *args); end
  def repl(target = T.unsafe(nil)); end
  def reset_eval_string; end
  def run_command(val); end
  def select_prompt; end
  def set_last_result(result, code = T.unsafe(nil)); end
  def should_print?; end
  def show_result(result); end
  def sticky_locals; end
  def suppress_output; end
  def suppress_output=(_arg0); end
  def update_input_history(code); end

  private

  def ensure_correct_encoding!(val); end
  def generate_prompt(prompt_proc, conf); end
  def handle_line(line, options); end
  def prompt_stack; end

  class << self
    def Code(obj); end
    def Method(obj); end
    def WrappedModule(obj); end
    def auto_resize!; end
    def binding_for(target); end
    def cli; end
    def cli=(_arg0); end
    def color(*args, &block); end
    def color=(*args, &block); end
    def commands(*args, &block); end
    def commands=(*args, &block); end
    def config; end
    def config=(_arg0); end
    def configure; end
    def critical_section; end
    def current; end
    def current_line; end
    def current_line=(_arg0); end
    def custom_completions; end
    def custom_completions=(_arg0); end
    def editor(*args, &block); end
    def editor=(*args, &block); end
    def eval_path; end
    def eval_path=(_arg0); end
    def exception_handler(*args, &block); end
    def exception_handler=(*args, &block); end
    def extra_sticky_locals(*args, &block); end
    def extra_sticky_locals=(*args, &block); end
    def final_session_setup; end
    def history(*args, &block); end
    def history=(*args, &block); end
    def hooks(*args, &block); end
    def hooks=(*args, &block); end
    def in_critical_section?; end
    def init; end
    def initial_session?; end
    def initial_session_setup; end
    def input(*args, &block); end
    def input=(*args, &block); end
    def last_internal_error; end
    def last_internal_error=(_arg0); end
    def line_buffer; end
    def line_buffer=(_arg0); end
    def load_file_at_toplevel(file); end
    def load_file_through_repl(file_name); end
    def load_history; end
    def load_rc_files; end
    def load_requires; end
    def load_traps; end
    def load_win32console; end
    def main; end
    def memory_size(*args, &block); end
    def memory_size=(*args, &block); end
    def output(*args, &block); end
    def output=(*args, &block); end
    def pager(*args, &block); end
    def pager=(*args, &block); end
    def print(*args, &block); end
    def print=(*args, &block); end
    def prompt(*args, &block); end
    def prompt=(*args, &block); end
    def quiet; end
    def quiet=(_arg0); end
    def rc_files_to_load; end
    def real_path_to(file); end
    def reset_defaults; end
    def run_command(command_string, options = T.unsafe(nil)); end
    def start(target = T.unsafe(nil), options = T.unsafe(nil)); end
    def start_with_pry_byebug(target = T.unsafe(nil), options = T.unsafe(nil)); end
    def start_without_pry_byebug(target = T.unsafe(nil), options = T.unsafe(nil)); end
    def toplevel_binding; end
    def toplevel_binding=(_arg0); end
    def view_clip(obj, options = T.unsafe(nil)); end
  end
end

Pry::BINDING_METHOD_IMPL = T.let(T.unsafe(nil), Array)
module Pry::Byebug; end

module Pry::Byebug::Breakpoints
  extend ::Enumerable
  extend ::Pry::Byebug::Breakpoints

  def add_file(file, line, expression = T.unsafe(nil)); end
  def add_method(method, expression = T.unsafe(nil)); end
  def breakpoints; end
  def change(id, expression = T.unsafe(nil)); end
  def delete(id); end
  def delete_all; end
  def disable(id); end
  def disable_all; end
  def each(&block); end
  def enable(id); end
  def find_by_id(id); end
  def last; end
  def size; end
  def to_a; end

  private

  def change_status(id, enabled = T.unsafe(nil)); end
  def validate_expression(exp); end
end

class Pry::Byebug::Breakpoints::FileBreakpoint < ::SimpleDelegator
  def source_code; end
  def to_s; end
end

class Pry::Byebug::Breakpoints::MethodBreakpoint < ::SimpleDelegator
  def initialize(byebug_bp, method); end

  def source_code; end
  def to_s; end
end

Pry::Commands = T.let(T.unsafe(nil), Pry::CommandSet)
Pry::EMPTY_COMPLETIONS = T.let(T.unsafe(nil), Array)
Pry::LOCAL_RC_FILE = T.let(T.unsafe(nil), String)
Pry::VERSION = T.let(T.unsafe(nil), String)

module PryByebug
  def current_remote_server; end
  def current_remote_server=(_arg0); end

  private

  def check_file_context(target, msg = T.unsafe(nil)); end
  def file_context?(target); end

  class << self
    def check_file_context(target, msg = T.unsafe(nil)); end
    def file_context?(target); end
  end
end

class PryByebug::BacktraceCommand < ::Pry::ClassCommand
  include ::PryByebug::Helpers::Navigation

  def process; end
end

class PryByebug::BreakCommand < ::Pry::ClassCommand
  include ::PryByebug::Helpers::Breakpoints
  include ::PryByebug::Helpers::Location
  include ::PryByebug::Helpers::Multiline

  def options(opt); end
  def process; end

  private

  def add_breakpoint(place, condition); end
  def new_breakpoint; end
  def option_to_method(option); end
  def print_all; end
  def process_condition; end
  def process_delete; end
  def process_delete_all; end
  def process_disable; end
  def process_disable_all; end
  def process_enable; end
  def process_show; end
end

class PryByebug::ContinueCommand < ::Pry::ClassCommand
  include ::PryByebug::Helpers::Navigation
  include ::PryByebug::Helpers::Breakpoints
  include ::PryByebug::Helpers::Location

  def process; end
end

class PryByebug::DownCommand < ::Pry::ClassCommand
  include ::PryByebug::Helpers::Navigation

  def process; end
end

class PryByebug::ExitAllCommand < ::Pry::Command::ExitAll
  def process; end
end

class PryByebug::FinishCommand < ::Pry::ClassCommand
  include ::PryByebug::Helpers::Navigation

  def process; end
end

class PryByebug::FrameCommand < ::Pry::ClassCommand
  include ::PryByebug::Helpers::Navigation

  def process; end
end

module PryByebug::Helpers; end

module PryByebug::Helpers::Breakpoints
  def bold_puts(msg); end
  def breakpoints; end
  def max_width; end
  def print_breakpoints_header; end
  def print_full_breakpoint(breakpoint); end
  def print_short_breakpoint(breakpoint); end
end

module PryByebug::Helpers::Location
  private

  def current_file(source = T.unsafe(nil)); end

  class << self
    def current_file(source = T.unsafe(nil)); end
  end
end

module PryByebug::Helpers::Multiline
  def check_multiline_context; end
end

module PryByebug::Helpers::Navigation
  def breakout_navigation(action, options = T.unsafe(nil)); end
end

class PryByebug::NextCommand < ::Pry::ClassCommand
  include ::PryByebug::Helpers::Navigation
  include ::PryByebug::Helpers::Multiline

  def process; end
end

class PryByebug::StepCommand < ::Pry::ClassCommand
  include ::PryByebug::Helpers::Navigation

  def process; end
end

class PryByebug::UpCommand < ::Pry::ClassCommand
  include ::PryByebug::Helpers::Navigation

  def process; end
end