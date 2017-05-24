import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NewUserComponent } from './new-user.component';
import { UserFormComponent } from '../user-form/user-form.component';
import { MockUserFormComponent } from '../../testing/mock-user-form.component';

describe('NewUserComponent', () => {
  let component: NewUserComponent;
  let fixture: ComponentFixture<NewUserComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [
        NewUserComponent,
        MockUserFormComponent
      ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NewUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
