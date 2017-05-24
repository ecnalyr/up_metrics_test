import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { UserService } from '../user.service';
import { UserListComponent } from './user-list.component';
import { UserFormComponent } from '../user-form/user-form.component';
import { MockUserService } from '../../testing/mock-user.service';
import { MockUserFormComponent } from '../../testing/mock-user-form.component';

describe('UserListComponent', () => {
  let component: UserListComponent;
  let fixture: ComponentFixture<UserListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [
        UserListComponent,
        MockUserFormComponent
      ]
    })
      .overrideComponent(UserListComponent, {
        set: {
          providers: [
            { provide: UserService, useClass: MockUserService }
          ]
        }
      })
      .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UserListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
