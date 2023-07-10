import gleam/io
import gleam/javascript/promise

const url = "https://dog.ceo/api/breeds/image/random"

pub fn main() {
  add_event_listener(
    "fetch",
    fn(event) {
      io.println("woof")
      respond_with(event, doggo())
    },
  )
}

external fn add_event_listener(name: String, listener: anything) -> Bool =
  "" "addEventListener"

fn doggo() {
  fetch(url)
  |> promise.await(get_json_body)
  |> promise.map(doggo_message)
  |> promise.await(fetch)
}

fn doggo_message(json) -> String {
  get_as_string(json, "message")
}

type Response

type Json

type Event


external fn get_as_string(from: Json, property: String) -> String =
  "" "Reflect.get"

external fn fetch(String) -> promise.Promise(Response) =
  "" "fetch"

external fn get_json_body(Response) -> promise.Promise(Json) =
  "" "Response.prototype.json.call"

external fn respond_with(Event, promise.Promise(Response)) -> Nil =
  "./ffi.js" "respondWith"


