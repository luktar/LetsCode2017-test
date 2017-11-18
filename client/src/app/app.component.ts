import { Component } from '@angular/core';
import { Http } from '@angular/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';

  private url = "/api/todo";

  constructor(private http: Http) {
  }

  ngOnInit() {
    this.http.get(this.url).subscribe((val) => {
      console.log(val);
    });
  }
}
